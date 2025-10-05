
import 'package:go_router/go_router.dart';
import '../views/ciclo_vida/ciclo_vida_screen.dart';
import '../views/paso_parametros/detalle_screen.dart';
import '../views/paso_parametros/paso_parametros_screen.dart';
import '../views/home/home_screen.dart';
import '../views/widgets_demo_screen.dart';
import '../views/future/async_demo_screen.dart';
import '../views/timer_screen.dart';
import '../views/insolate/isolate_demo_screen.dart';
import '../views/pokemons/pokemon_list_view.dart';
import '../views/pokemons/pokemon_detail_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(), // Usa HomeView
    ),
    // Rutas para el paso de parámetros
    GoRoute(
      path: '/paso_parametros',
      name: 'paso_parametros',
      builder: (context, state) => const PasoParametrosScreen(),
    ),

    // !Ruta para el detalle con parámetros
    GoRoute(
      path:
          '/detalle/:parametro/:metodo', //la ruta recibe dos parametros los " : " indican que son parametros
      builder: (context, state) {
        //*se capturan los parametros recibidos
        // declarando las variables parametro y metodo
        // es final porque no se van a modificar
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreen(parametro: parametro, metodoNavegacion: metodo);
      },
    ),
    //!Ruta para el ciclo de vida
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
    // Ruta para demo de widgets (GridView, TabBar, ListView)
    GoRoute(
      path: '/widgets_demo',
      builder: (context, state) => const WidgetsDemoScreen(),
    ),
    // Ruta para demo de Future/async/await
    GoRoute(
      path: '/async_demo',
      builder: (context, state) => const AsyncDemoScreen(),
    ),
    // Ruta para demo de Timer
    GoRoute(
      path: '/timer',
      builder: (context, state) => const TimerScreen(),
    ),
    // Ruta para demo de Isolate
    GoRoute(
      path: '/isolate_demo',
      builder: (context, state) => const IsolateDemoScreen(),
    ),
    // Ruta para lista de Pokémon
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonListView(),
    ),
    // Ruta para detalle de Pokémon
    GoRoute(
      path: '/pokemon/:name',
      builder: (context, state) {
        final name = state.pathParameters['name']!;
        return PokemonDetailView(name: name);
      },
    ),
  ],
);
