<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table = 'products';
    protected $fillable = [
        'name',
        'price',
        'image',
        'category', // Tambahkan kolom category
    ];

    //return column image with link
    public function getImageAttribute($image)
    {
        return asset('storage/' . $image);
    }

    public function cartItems()
    {
        return $this->hasMany(CartItem::class);
    }
}
