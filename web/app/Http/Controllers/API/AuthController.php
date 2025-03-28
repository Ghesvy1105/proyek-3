<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\RegisterRequest;

class AuthController extends Controller
{
    function register(RegisterRequest $request)
    {
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'role' => 'pemesan',
        ]);

        return response()->json([
            'status' => true,
            'message' => 'User registered successfully'
        ]);
    }

    function login(Request $request)
    {
        //login using email and password and role pemesan
        $user = User::where('email', $request->email)->where('role', 'pemesan')->first();

        if (!$user) {
            return response()->json([
                'status' => false,
                'message' => 'User not found'
            ]);
        }

        if (!Hash::check($request->password, $user->password)) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid credentials'
            ]);
        }

        $token = $user->createToken('token-name')->plainTextToken;

        return response()->json([
            'status' => true,
            'token' => $token,
            'data' => $user,
            'message' => 'User logged in successfully'
        ]);
    }

    public function logout(Request $request)
    {
        $user = auth('sanctum')->user(); // Ambil user yang sedang login
        if ($user) {
            $user->tokens()->delete();
            return response()->json(['message' => 'Successfully logged out']);
        }

        return response()->json(['message' => 'User not authenticated'], 401);
    }
}
