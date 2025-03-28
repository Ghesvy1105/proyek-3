<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    // Menampilkan semua produk
    public function index()
    {
        $products = Product::all(); // Mengambil semua produk
        return view('products.index', compact('products'));
    }

    // Menampilkan menu produk, dengan kategori makanan dan minuman
    public function showMenu()
    {
        $foods = Product::where('category', 'makanan')->get(); // Mengambil produk kategori makanan
        $drinks = Product::where('category', 'minuman')->get(); // Mengambil produk kategori minuman

        // Mengirim data makanan dan minuman ke view 'menu'
        return view('menu', compact('foods', 'drinks'));
    }

    // Menampilkan form tambah produk
    public function create()
    {
        return view('products.create');
    }

    // Menyimpan produk baru
    public function store(Request $request)
    {
        // Validasi input, termasuk kategori
        $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif',
            'category' => 'required|in:makanan,minuman', // Validasi category,
            'in_stock' => 'required|integer|min:0', // Validasi in_stock
        ]);

        // Simpan gambar ke storage
        $imagePath = $request->file('image')->storeAs(
            'images', // Folder penyimpanan
            $request->file('image')->getClientOriginalName(), // Nama file asli
            'public' // Disk
        );
        Product::create([
            'name' => $request->name,
            'price' => $request->price,
            'image' => $imagePath,
            'category' => $request->category, // Menambahkan category
            'in_stock' => $request->in_stock, // Menambahkan in_stock
        ]);

        return redirect()->route('products.index')->with('success', 'Produk berhasil ditambahkan');
    }

    // Menampilkan form edit produk
    public function edit($id)
    {
        $product = Product::findOrFail($id); // Ambil produk berdasarkan ID
        return view('products.edit', compact('product'));
    }

    // Mengupdate produk
    public function update(Request $request, $id)
    {
        // Validasi input, termasuk kategori
        $request->validate([
            'name' => 'required|string|max:255',
            'price' => 'required|numeric',
            'image' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
            'category' => 'required|in:makanan,minuman', // Validasi category
            'in_stock' => 'required|integer|min:0', // Validasi in_stock
        ]);

        // Ambil produk yang akan di-update
        $product = Product::findOrFail($id);
        // Cek apakah ada gambar baru yang di-upload
        if ($request->hasFile('image')) {
            // Hapus gambar lama jika ada
            if (!empty($product->image)) {
                Storage::disk('public')->delete($product->image);
            }

            // Simpan gambar baru
            $imagePath = $request->file('image')->storeAs(
                'images', // Folder penyimpanan dalam storage/app/public
                $request->file('image')->getClientOriginalName(), // Nama file asli
                'public' // Disk penyimpanan
            );
        } else {
            $imagePath = Str::after($product->image, 'storage/');
        }

        // Update produk dengan category
        $product->update([
            'name' => $request->name,
            'price' => $request->price,
            'image' => $imagePath,
            'category' => $request->category, // Memperbarui category
            'in_stock' => $request->in_stock, // Memperbarui in_stock
        ]);

        return redirect()->route('products.index')->with('success', 'Produk berhasil diperbarui');
    }

    // Menghapus produk
    public function destroy($id)
    {
        $product = Product::findOrFail($id); // Ambil produk yang akan dihapus

        // Hapus gambar dari storage jika ada
        if ($product->image) {
            Storage::disk('public')->delete($product->image);
        }

        // Hapus produk dari database
        $product->delete();

        return redirect()->route('products.index')->with('success', 'Produk berhasil dihapus');
    }
}
