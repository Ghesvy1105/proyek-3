<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class AiController extends Controller
{
    public function logSearch(Request $request)
    {
        $request->validate(['keyword' => 'required|string']);

        DB::table('search_logs')->insert([
            'user_id' => Auth::id(),
            'keyword' => $request->keyword,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        return response()->json(['status' => true, 'message' => 'Search log saved']);
    }

    public function popularMenus()
    {
        $popularKeywords = DB::table('search_logs')
            ->select('keyword', DB::raw('count(*) as total'))
            ->groupBy('keyword')
            ->orderByDesc('total')
            ->limit(5)
            ->pluck('keyword')
            ->toArray();

        // Ambil semua product yang mengandung keyword populer
        $menus = Product::where(function ($query) use ($popularKeywords) {
            foreach ($popularKeywords as $keyword) {
                $query->orWhere('name', 'like', "%$keyword%");
            }
        })->get();

        // Urutkan hasil berdasarkan urutan popularKeywords
        $sortedMenus = collect($popularKeywords)->flatMap(function ($keyword) use ($menus) {
            return $menus->filter(function ($menu) use ($keyword) {
                return stripos($menu->name, $keyword) !== false;
            });
        })->unique('id')->values();

        return response()->json(['status' => true, 'data' => $sortedMenus]);
    }
}
