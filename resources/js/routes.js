import adminDashboard from './components/admin/adminDashboard'
import quizesComponent from './components/admin/quizesComponent'
import addQuizeComponent from './components/admin/addQuizeComponent'

export const projectRoutes = [
    {
        path: '/dashboard',
        component: adminDashboard

    },
    {
        path: '/quizes',
        component: quizesComponent

    },
    {
        path: '/add_quize',
        component: addQuizeComponent

    },
]
