<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a  class="brand-link" href="/">
        <img src="{{ asset('storage/admin') }}/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>
    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{ asset('storage/admin') }}/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <router-link to="/profile" class="d-block">Hasan </router-link>
            </div>
        </div>
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                <li class="nav-item"><router-link to="/dashboard" class="nav-link {{ (request()->is('/dashboard')) ?? 'active' }}"><i class="nav-icon fas fa-tachometer-alt"></i><p>Dashboard</p></router-link></li>
                <li class="nav-item"><router-link to="/quizes" class="nav-link {{  (request()->is('/quizes')) ?? 'active'  }}"><i class="nav-icon fas fa-th"></i><p>Quiz List</p></router-link></li>
                <li class="nav-item"><router-link to="/add_quize" class="nav-link {{  (request()->is('/add_quize')) ?? 'active'  }}"><i class="nav-icon fas fa-th"></i><p>Add Quiz</p></router-link></li>
                <li class="nav-item"><a   href="{{ route('logout') }}" class="nav-link"><i class="nav-icon fas fa-th"></i><p>Logout</p></a></li>

            </ul>
        </nav>
    </div>
</aside>
