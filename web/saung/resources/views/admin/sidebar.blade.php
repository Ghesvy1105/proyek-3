<head>
    <link rel="icon" href="{{ asset('gambar/logo1.png') }}" type="image/png" sizes="32x32">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


</head>
<div class="col-md-2 bg-dark text-white">


    <h4 class="text-center mt-4">Admin Dashboard</h4>
    <ul class="nav flex-column mt-5">
        <li class="nav-item">
            <a class="nav-link text-white" href="{{ route('admin.dashboard') }}">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="{{ route('orders.index') }}">
                <i class="fas fa-shopping-cart"></i> Lihat Pesanan
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="{{ route('products.index') }}">
                <i class="fas fa-box"></i> Produk
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-white" href="{{ route('admin.call') }}">
                <i class="fas fa-phone"></i> Panggil
            </a>
        </li>


        <li class="nav-item">
            <a class="nav-link text-white" data-bs-toggle="collapse" href="#settingsMenu" role="button" aria-expanded="false" aria-controls="settingsMenu">
                <i class="fas fa-cog"></i> Pengaturan
            </a>
            <div class="collapse mt-2" id="settingsMenu">
                <!-- Tombol Logout -->
                <form action="{{ route('logout') }}" method="POST" class="d-inline">
                    @csrf
                    <button type="submit" class="btn btn-danger btn-sm w-100">Logout</button>
                </form>
            </div>
        </li>


    </ul>
</div>
