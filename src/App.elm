module App exposing (..)

import Html exposing (Html, text, div, img, input, br, span)
import Html.Attributes exposing (value, src)
import Html.Events exposing (onInput)
import Html exposing (Html, text, div, node, a)
import Html.Attributes exposing (attribute, style, class, href)
import Html.Events exposing (onClick)
import Polymer.App as App
import Polymer.Paper as Paper
import Svg
import Svg.Attributes as SA


type alias Model =
    { url : String
    , top : String
    , bottom : String
    }


init : ( Model, Cmd Msg )
init =
    ( { url = "http://www.rd.com/wp-content/uploads/sites/2/2016/04/01-cat-wants-to-tell-you-laptop.jpg"
      , top = "My friend"
      , bottom = "the cat"
      }
    , Cmd.none
    )


type Msg
    = SetUrl String
    | SetTop String
    | SetBottom String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetUrl url ->
            { model | url = url } ! []

        SetTop top ->
            { model | top = top } ! []

        SetBottom bottom ->
            { model | bottom = bottom } ! []


baseUrl : String
baseUrl =
    "https://immense-forest-64118.herokuapp.com"


url : String -> String -> String -> String
url image top bottom =
    baseUrl
        ++ "/fly/meme?url="
        ++ image
        ++ "&top="
        ++ top
        ++ "&bottom="
        ++ bottom


view : Model -> Html Msg
view model =
    div []
        [ App.headerLayout
            []
            [ App.header
                [ attribute "effects" "waterfall"
                , attribute "fixed" ""
                ]
                [ App.toolbar
                    []
                    [ div
                        [ class "title" ]
                        [ span [] [ text "Meme it up" ]
                        , span [ class "marketing" ]
                            [ text "A project from "
                            , a
                                [ href "https://www.dailydrip.com" ]
                                [ text "DailyDrip" ]
                            ]
                        ]
                    ]
                ]
            , div
                [ class "section group" ]
                [ div [ class "col span_1_of_2" ]
                    [ Paper.card
                        [ attribute "heading" "Fiddle with this junk" ]
                        [ div
                            [ class "card-content"
                            ]
                            [ Paper.input
                                [ onInput SetUrl
                                , attribute "label" "URL"
                                , value model.url
                                ]
                                []
                            , br [] []
                            , Paper.input
                                [ onInput SetTop
                                , attribute "label" "Top"
                                , value model.top
                                ]
                                []
                            , br [] []
                            , Paper.input
                                [ onInput SetBottom
                                , attribute "label" "Bottom"
                                , value model.bottom
                                ]
                                []
                            ]
                        ]
                    ]
                , div [ class "col span_1_of_2" ]
                    [ Paper.card
                        [ attribute "heading" "Oooh look you made a thing" ]
                        [ div [ class "card-content" ]
                            [ Paper.input
                                [ attribute "disabled" "true"
                                , attribute
                                    "label"
                                    "Meme URL (copy it, paste elsewhere, make memes dreams)"
                                , value <| url model.url model.top model.bottom
                                ]
                                []
                            , img [ src (url model.url model.top model.bottom) ] []
                            ]
                        ]
                    ]
                ]
            ]
        , githubCorner
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


githubCorner : Html Msg
githubCorner =
    div []
        [ a
            [ href "https://github.com/dailydrip/meme"
            , class "github-corner"
            , attribute "ariaLabel" "View source on GitHub"
            ]
            [ Svg.svg
                [ SA.width "80"
                , SA.height "80"
                , SA.viewBox "0 0 250 250"
                , attribute "ariaHidden" "true"
                ]
                [ Svg.path
                    [ SA.d "M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"
                    ]
                    []
                , Svg.path
                    [ SA.d "M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2"
                    , SA.fill "currentColor"
                    , SA.class "octo-arm"
                    ]
                    []
                , Svg.path
                    [ SA.d "M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z"
                    , SA.fill "currentColor"
                    , SA.class "octo-body"
                    ]
                    []
                ]
            ]
        ]
