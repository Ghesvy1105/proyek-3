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
        'category', // Tambahkan kolom category,
        'in_stock' // Tambahkan kolom in_stock
    ];

    public function getInStockAttribute($in_stock)
    {
        return $in_stock ? true : false;
    }

    //return column image with link
    public function getImageAttribute($image)
    {
        if ($image) {
            return asset('storage/' . $image);
        } else {
            return $image;
        }
    }

    public function cartItems()
    {
        return $this->hasMany(CartItem::class);
    }
}
