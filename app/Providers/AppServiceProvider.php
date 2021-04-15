<?php

namespace App\Providers;

use App\Http\Resources\QuizResource;
use App\Http\Resources\SectionResource;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        QuizResource::withoutWrapping();

    }
}
