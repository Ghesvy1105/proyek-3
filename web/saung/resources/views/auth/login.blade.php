<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="icon" href="{{ asset('gambar/logo1.png') }}" type="image/png" sizes="32x32">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            background-image: url('{{ asset('gambar/page.png') }}');
            background-size: cover;
            background-position: center;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            width: 100%;
            max-width: 400px;
            background: rgba(217, 215, 213, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: rgb(24, 24, 24);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: rgb(73, 71, 71);
            font-weight: bold;
        }
        .form-group input {
            width: 95%;
            padding: 10px;
            border: 1px solid #676666;
            border-radius: 4px;
            font-size: 14px;
        }
        .form-group span {
            color: red;
            font-size: 12px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        a {
            text-decoration: none;
            color: #0056b3;
            font-size: 14px;
            margin-top: 10px;
            display: block;
            text-align: center;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>LOGIN</h2>
        <form method="POST" action="{{ route('login') }}">
            @csrf

            <!-- Email -->
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" type="email" name="email" value="{{ old('email') }}" required>
                @error('email')
                <span>{{ $message }}</span>
                @enderror
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" type="password" name="password" required>
                @error('password')
                <span>{{ $message }}</span>
                @enderror
            </div>

            <!-- Remember Me -->
            <div class="form-group">
                <label>
                    <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Remember Me
                </label>
            </div>

            <!-- Submit -->
            <button type="submit">Login</button>

            <!-- Forgot Password -->
          <!--  @if (Route::has('password.request'))
            <a href="{{ route('password.request') }}">Lupa Kata Sandi Anda?</a>
            @endif -->

            @if (Route::has('register'))
            <a href="{{ route('register') }}">Belum punya akun? Daftar di sini</a>
            @endif
        </form>
    </div>
</body>
</html>
