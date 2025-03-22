<?php

namespace App\Http\Controllers\API;

use Carbon\Carbon;
use App\Models\Order;
use App\Models\Product;
use App\Models\CartItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class APIController extends Controller
{
    public function getMenu()
    {
        $category = request('category');
        $data = Product::when($category, function ($query) use ($category) {
            return $query->where('category', $category);
        })->get();

        return response()->json(['status' => true, 'data' => $data]);
    }

    public function getMenuDetail($id)
    {
        $product = Product::find($id);

        return response()->json(['status' => true, 'data' => $product]);
    }

    public function getKeranjang()
    {
        $cartItems = CartItem::where('user_id', Auth::id())->with('product')->get();

        return response()->json(['status' => true, 'data' => $cartItems]);
    }

    public function addToKeranjang(Request $request)
    {
        $request->validate([
            'menu_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1'
        ]);

        $cartItem = CartItem::updateOrCreate(
            ['user_id' => Auth::id(), 'product_id' => $request->menu_id],
            ['quantity' => DB::raw("quantity + {$request->quantity}")]
        );

        return response()->json(['status' => true, 'message' => 'Item berhasil ditambahkan ke keranjang']);
    }

    public function updateKeranjang(Request $request, $id)
    {
        $request->validate(['quantity' => 'required|integer|min:1']);

        $cartItem = CartItem::where('id', $id)->where('user_id', Auth::id())->first();

        if (!$cartItem) {
            return response()->json(['status' => false, 'message' => 'Item tidak ditemukan'], 404);
        }

        $cartItem->update(['quantity' => $request->quantity]);

        return response()->json(['status' => true, 'message' => 'Keranjang berhasil diperbarui']);
    }

    public function removeKeranjang($id)
    {
        $cartItem = CartItem::where('id', $id)->where('user_id', Auth::id())->first();

        if (!$cartItem) {
            return response()->json(['status' => false, 'message' => 'Item tidak ditemukan'], 404);
        }

        $cartItem->delete();

        return response()->json(['status' => true, 'message' => 'Item dihapus dari keranjang']);
    }

    public function checkOut(Request $request)
    {
        $request->validate(['table_number' => 'required|integer', 'special_requests' => 'nullable|string']);

        $cartItems = CartItem::where('user_id', Auth::id())->with('product')->get();

        if ($cartItems->isEmpty()) {
            return response()->json(['status' => false, 'message' => 'Keranjang kosong'], 400);
        }

        $order = Order::create([
            'user_id' => Auth::id(),
            'customer_name' => Auth::user()->name,
            'table_number' => $request->table_number,
            'items' => $cartItems->map(fn($item) => [
                'product_id' => $item->product_id,
                'quantity' => $item->quantity,
                'price' => $item->product->price
            ])->toArray(),
            'total_price' => $cartItems->sum(fn($item) => $item->quantity * $item->product->price),
            'order_date' => Carbon::now(),
            'is_new' => true,
            'packed' => false,
            'special_requests' => $request->special_requests,
            'payment_status' => 'sudah bayar'
        ]);

        CartItem::where('user_id', Auth::id())->delete();

        return response()->json(['status' => true, 'data' => $order, 'title' => 'Pesanan Diterima', 'message' => 'Pesananmu sudah diterima dan akan segera dipersiapkan, silahkan menunggu dengan santuy ya..', 'data' => $order]);
    }

    public function getCheckOut()
    {
        $orders = Order::where('customer_name', Auth::user()->name)->orderBy('order_date', 'desc')->get();

        return response()->json(['status' => true, 'data' => $orders]);
    }

    public function getDetailCheckout($id)
    {
        $order = Order::find($id);

        if (!$order) {
            return response()->json([
                'status' => false,
                'message' => 'Pesanan tidak ditemukan'
            ], 404);
        }

        $items = is_array($order->items) ? $order->items : json_decode($order->items, true);

        return response()->json([
            'status' => true,
            'data' => [
                'order_id' => $order->id,
                'customer_name' => $order->customer_name,
                'table_number' => $order->table_number,
                'total_price' => $order->total_price,
                'order_date' => Carbon::parse($order->order_date)->format('Y-m-d, H:i'),
                'is_new' => $order->is_new,
                'packed' => $order->packed,
                'special_requests' => $order->special_requests,
                'items' => collect($items)->map(function ($item) {
                    $product = Product::find($item['product_id'] ?? null);

                    return [
                        'product_id' => $product->id ?? null,
                        'product_name' => $product->name ?? 'Produk tidak ditemukan',
                        'quantity' => $item['quantity'] ?? 0,
                        'price' => $product->price ?? 0,
                        'subtotal' => ($item['quantity'] ?? 0) * ($product->price ?? 0),
                    ];
                })
            ]
        ]);
    }

    public function getProfile()
    {
        return response()->json(['status' => true, 'data' => Auth::user()]);
    }

    public function updateProfile(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email,' . Auth::id()
        ]);

        Auth::user()->update($request->only('name', 'email'));

        return response()->json(['status' => true, 'message' => 'Profil berhasil diperbarui']);
    }
}
