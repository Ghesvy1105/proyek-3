<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SearchLog;

class SearchLogController extends Controller
{
    public function store(Request $request)
    {
        SearchLog::create([
            'keyword' => $request->input('keyword'),
        ]);

        return response()->json(['message' => 'Search logged']);
    }
}
