module Dashboard.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)

import App.Messages exposing (Msg(..))
import App.Models exposing (Route(HeroRoute))
import App.Utils exposing (onLinkClick)
import Heroes.Models exposing (Hero)
import Routing

view : Maybe (List Hero) -> Html Msg
view heroes =
    div [ class "dashboard" ]
        [ h3 [] [ text "Top Heroes" ]
        , maybeList heroes
        ]

maybeList : Maybe (List Hero) -> Html Msg
maybeList heroes =
    case heroes of
        Just heroes ->
            div [ class "grid grid-pad" ]
                (List.map heroCard heroes)
        
        Nothing ->
            text ""


heroCard : Hero -> Html Msg
heroCard hero =
    div [ onLinkClick (ChangeLocation (Routing.toUrl (HeroRoute hero.id))), class "col-1-4"]
        [ div [ class "module hero" ]
            [ h4 []
                [ text hero.name ]
            ]
        ]