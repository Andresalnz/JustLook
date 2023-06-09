# JustDown :clapper:

Aplicación que devuelve un listado de series y peliculas
Puedes revisar información del detalle de las peliculas y buscar cualquier pelicula o serie

| List Movies | Detail Movie |
| ----------- | ------------ |
| ![List Movies](Screenshot/ListMovies.png) | ![Detail Movie](Screenshot/DetailMovie.png) |

| List Series | List Search |
| ----------- | ------------ |
| ![List Movies](Screenshot/ListSeries.png) | ![Detail Movie](Screenshot/ListSearch.png) |

## Pre-Requisitos :memo:

Añade un archivo xcconfig dentro de la carpeta SupportingFiles y coloca tu apikey --> `API_KEY = TU API KEY`

## Arquitectura

Para esta aplicación he usado la arquitectura Viper, que consta de:

- View --> Vista que representa lo que envie el presenter, esta capa debe ser pasiva, se debe evitar hacer cualquier logica. 

- Interactor --> Capa que realiza la petición HTTP. La cual se comunica con las entidades para devolver una respuesta, dicha respuesta se le pasa al presenter y éste a la vista.  

- Presenter --> Capa que contiene el 99% de la logica de la aplicación. Es la que se comunica con el interactor para que le de una respuesta. Y se comunica con la vista para pasar lo que tiene que pintar.

- Entity --> Capa de modelo. Tiene toda la informacón que representa el JSON. 

- Router --> Contiene toda la navegación de la app. 

## Stack Tecnologico

- Xcode 14.3.1
- [Alamofire 5.6.4](https://github.com/Alamofire/Alamofire)
- [KingFisher 7.6.4](https://github.com/onevcat/Kingfisher)
- Swift y UiKit

## Estado del proyecto

Abierto a mejoras


## Autor

**Andres Aleu :v:**
