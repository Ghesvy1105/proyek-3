@extends('layouts.app')

@section('content')
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        @vite(['resources/sass/app.scss', 'resources/js/app.js'])

        <style>
            .carousel-item img {
                object-fit: cover;
            }
            .location-info {
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>

    <body>
        <main class="container mt-5">
            <div class="content">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="{{ asset('gambar/15.jpg') }}" class="d-block w-100" alt="Slide 1">
                        </div>
                        <div class="carousel-item">
                            <img src="{{ asset('gambar/14.jpg') }}" class="d-block w-100" alt="Slide 2">
                        </div>
                        <div class="carousel-item">
                            <img src="{{ asset('gambar/9.jpg') }}" class="d-block w-100" alt="Slide 3">
                        </div>
                        <div class="carousel-item">
                            <img src="{{ asset('gambar/12.jpg') }}" class="d-block w-100" alt="Slide 4">
                        </div>
                        <div class="carousel-item">
                            <img src="{{ asset('gambar/13.jpg') }}" class="d-block w-100" alt="Slide 5">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <br>
                <h3 class="text-center fw-bold text-decoration-underline mb-4">Sawung Biung</h3>
                <p class="text-justify fs-5 lh-lg">Sawung Biung terletak di Indramayu. Sawung Biung menawarkan hidangan khas daerah dengan cita rasa otentik.
                    Menu kami mencakup berbagai pilihan makanan lokal yang memanjakan lidah Anda, dengan harga yang terjangkau.
                    Suasana kedai ini didesain untuk menciptakan ruang yang santai dan ramah.</p>
                <p class="text-justify fs-5 lh-lg">Dekorasi yang sederhana namun menarik menciptakan atmosfer yang hangat, cocok untuk pertemuan santai atau makan malam bersama teman.
                    Tim Sawung Biung selalu siap melayani Anda dengan senyum dan keramahan.
                    Kami berkomitmen untuk memberikan pengalaman pelanggan yang positif dan memastikan kenyamanan setiap tamu.</p>
                <div class="location-info">
                    <h3 class="text-center fw-bold text-decoration-underline mb-4">Kontak Kami</h3>
                    <p><i class="bi bi-whatsapp me-2"></i> (+62) 83148050378</p>
                    <p><i class="bi bi-instagram me-2"></i> Sawung_Biung123</p>
                    <p><i class="bi bi-envelope-fill me-2"></i> meli@gmail.com</p>
                </div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
            integrity="sha384-eMNwWpr2X+0BxkHqv2yF3rCy4I4wAw55Cd2Wh5c+VuBxJn38N6Ug8U2r9LoK0G7M"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIphBgfWI58eHftcVQ1K6u7t6x0F/2Ff3rjqN7ERoyX5ZW5L8hGhKP7x4Rg2Q"
            crossorigin="anonymous"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var myCarousel = document.getElementById('carouselExampleIndicators');
                var carousel = new bootstrap.Carousel(myCarousel, {
                    interval: false
                });
            });
        </script>
    </body>

    </html>
@endsection
