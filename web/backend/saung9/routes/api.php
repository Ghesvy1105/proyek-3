<?php

use App\Http\Controllers\API\APIController;
use App\Http\Controllers\API\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/menu', [APIController::class, 'getMenu']);
    Route::get('/menu/{id}/detail', [APIController::class, 'getMenuDetail']);

    Route::get('/keranjang', [APIController::class, 'getKeranjang']);
    Route::post('/keranjang', [APIController::class, 'addToKeranjang']);
    Route::post('/keranjang/{id}', [APIController::class, 'updateKeranjang']);
    Route::delete('/keranjang/{id}', [APIController::class, 'removeKeranjang']);

    Route::get('/check-out', [APIController::class, 'getCheckOut']);
    Route::post('/check-out', [APIController::class, 'checkOut']);
    Route::get('/check-out/{id}/detail', [APIController::class, 'getDetailCheckout']);


    Route::get('/profile', [APIController::class, 'getProfile']);
    Route::post('/profile', [APIController::class, 'updateProfile']);
    Route::post('logout', [AuthController::class, 'logout']);
});
