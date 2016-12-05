module AddNew.View exposing (..)

import AddNew.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, onClick, onInput, onSubmit, targetValue)
import I18n exposing (getImageUrlOrOgpLogo, getName)
import Json.Decode as Decode


viewOrganization : Model -> I18n.Language -> Html Msg
viewOrganization model language =
    let
        viewForm =
            div [ class "col-xs-12" ]
                [ div [ class "row section-form" ]
                    [ div [ class "col-xs-12" ]
                        [ div [ class "form-group" ]
                            [ label [ for "nameField" ]
                                [ text "Name" ]
                            , input
                                [ class "form-control"
                                , id "nameField"
                                , onInput (\x -> ForSelf (SetField "Name" x))
                                , placeholder "What's the official name of the organization?"
                                , required True
                                , type' "text"
                                ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ label [ for "aboutField" ]
                                [ text "About" ]
                            , input
                                [ class "form-control"
                                , id "aboutField"
                                , onInput (\x -> ForSelf (SetField "Description" x))
                                , placeholder "Add a complete description"
                                , type' "text"
                                ]
                                []
                            ]
                        ]
                    ]
                , div [ class "row section-form" ]
                    [ -- TODO input text
                      -- , div [ class "col-xs-6" ]
                      --     [ div [ class "form-group" ]
                      --         [ label [ for "licenseField" ]
                      --             [ text "License" ]
                      --         , select [ class "form-control", id "licenseField" ]
                      --             [ option []
                      --                 [ text "1" ]
                      --             , option []
                      --                 [ text "2" ]
                      --             , option []
                      --                 [ text "3" ]
                      --             , option []
                      --                 [ text "4" ]
                      --             , option []
                      --                 [ text "5" ]
                      --             ]
                      --         ]
                      --     ]
                      div [ class "col-xs-12" ]
                        [ div [ class "form-group" ]
                            [ label [ for "websiteLinkField" ]
                                [ text "Website link" ]
                            , input
                                [ class "form-control"
                                , id "websiteLinkField"
                                , onInput (\x -> ForSelf (SetField "Website" x))
                                , placeholder "Enter the address of the informational website"
                                , type' "url"
                                ]
                                []
                            ]
                        ]
                    ]
                ]
    in
        Html.form
            [ onSubmit (ForSelf SubmitFields) ]
            [ div [ class "row section" ]
                [ div [ class "container" ]
                    [ div [ class "row" ]
                        [ div [ class "col-md-12 content content-left" ]
                            [ div [ class "row" ]
                                [ div [ class "col-xs-12" ]
                                    [ h1 []
                                        [ text (I18n.translate language I18n.AddNewOrganization) ]
                                    ]
                                ]
                            ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col-md-9 content content-left" ]
                            [ div [ class "row" ]
                                [ viewForm ]
                            ]
                        ]
                    ]
                ]
            , div [ class "row section-form last" ]
                [ div [ class "container" ]
                    [ div [ class "col-md-9 content content-left" ]
                        [ button
                            [ class "btn btn-default pull-right"
                            , disabled
                                (case model.imageUploadStatus of
                                    NotUploaded ->
                                        False

                                    Uploaded _ ->
                                        False

                                    UploadError _ ->
                                        True
                                )
                            , type' "submit"
                            ]
                            [ text (I18n.translate language I18n.PublishOrganization) ]
                        ]
                    ]
                ]
            ]


viewTool : Model -> I18n.Language -> Html Msg
viewTool model language =
    let
        viewForm =
            div [ class "col-xs-12" ]
                [ div [ class "row section-form" ]
                    [ div [ class "col-xs-12" ]
                        [ div [ class "form-group" ]
                            [ label [ for "nameField" ]
                                [ text "Name" ]
                            , input
                                [ class "form-control"
                                , id "nameField"
                                , onInput (\x -> ForSelf (SetField "Name" x))
                                , placeholder "What's the official name of the tool?"
                                , required True
                                , type' "text"
                                ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ label [ for "aboutField" ]
                                [ text "About" ]
                            , input
                                [ class "form-control"
                                , id "aboutField"
                                , onInput (\x -> ForSelf (SetField "Description" x))
                                , placeholder "Add a complete description"
                                , type' "text"
                                ]
                                []
                            ]
                        ]
                    ]
                , div [ class "row section-form" ]
                    [ div [ class "col-xs-6" ]
                        [ div [ class "form-group" ]
                            [ label [ for "typeField" ]
                                [ text "Type" ]
                            , select
                                [ class "form-control"
                                , id "typeField"
                                , on "change"
                                    (Html.Events.targetValue
                                        |> Decode.map (\x -> ForSelf (SetField "Types" x))
                                    )
                                ]
                                [ option [ value "type:software" ]
                                    [ text "Software" ]
                                , option [ value "type:platform" ]
                                    [ text "Platform" ]
                                ]
                            ]
                        ]
                    , div [ class "col-xs-6" ]
                        [ div [ class "form-group" ]
                            [ label [ for "licenseField" ]
                                [ text "License" ]
                            , input
                                [ class "form-control"
                                , id "licenseField"
                                , onInput (\x -> ForSelf (SetField "License" x))
                                , type' "text"
                                ]
                                []
                            ]
                        ]
                    , div [ class "col-xs-12" ]
                        [ div [ class "form-group" ]
                            [ label [ for "websiteLinkField" ]
                                [ text "Website link" ]
                            , input
                                [ class "form-control"
                                , id "websiteLinkField"
                                , onInput (\x -> ForSelf (SetField "Website" x))
                                , placeholder "Enter the address of the informational website"
                                , type' "url"
                                ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ label [ for "downloadLinkField" ]
                                [ text "Download link" ]
                            , input
                                [ class "form-control"
                                , id "downloadLinkField"
                                , onInput (\x -> ForSelf (SetField "Download" x))
                                , placeholder "Enter the address to download the tool"
                                , type' "url"
                                ]
                                []
                            ]
                        ]
                    ]
                , div [ class "row section-form" ]
                    [ div [ class "col-xs-12" ]
                        [ div [ class "panel panel-default panel-collapse" ]
                            [ div
                                [ attribute "aria-controls" "collapseTwo"
                                , attribute "aria-expanded" "false"
                                , attribute "data-parent" "#accordion"
                                , attribute "data-target" "#collapseTwo"
                                , attribute "data-toggle" "collapse"
                                , attribute "role" "tab"
                                , class "panel-heading"
                                , id "headingTwo"
                                ]
                                [ div [ class "row" ]
                                    [ div [ class "col-xs-8 text-left" ]
                                        [ h3 [ class "panel-title" ]
                                            [ text "Additional informations" ]
                                        ]
                                    , div [ class "col-xs-4 text-right" ]
                                        [ a [ class "show-more pull-right" ]
                                            [ text "Show more"
                                            , span [ class "glyphicon glyphicon-menu-down" ]
                                                []
                                            ]
                                        ]
                                    ]
                                ]
                            , div
                                [ attribute "aria-labelledby" "headingTwo"
                                , class "panel-collapse collapse"
                                , id "collapseTwo"
                                , attribute "role" "tabpanel"
                                ]
                                [ div [ class "panel-body nomargin" ]
                                    [ div [ class "form-group" ]
                                        [ label [ for "releaseDateField" ]
                                            [ text "Release date" ]
                                        , input
                                            [ class "form-control"
                                            , id "releaseDateField"
                                            , onInput (\x -> ForSelf (SetField "Release Date" x))
                                              -- , placeholder "What's the official name of the tool?" -- TODO
                                            , type' "date"
                                            ]
                                            []
                                        ]
                                    , div [ class "form-group" ]
                                        [ label [ for "publisherField" ]
                                            [ text "Publisher" ]
                                        , input
                                            [ class "form-control"
                                            , id "publisherField"
                                            , onInput (\x -> ForSelf (SetField "Publisher" x))
                                              -- , placeholder "What's the official name of the tool?" -- TODO
                                            , type' "text"
                                            ]
                                            []
                                        ]
                                      -- , div [ class "form-group" ]
                                      --     [ label [ for "exampleInputFile" ]
                                      --         [ text "File input" ]
                                      --     , input [ id "exampleInputFile", type' "file" ]
                                      --         []
                                      --     , p [ class "help-block" ]
                                      --         [ text "Example block-level help text here." ]
                                      --     ]
                                      -- , div [ class "checkbox" ]
                                      --     [ label []
                                      --         [ input [ type' "checkbox" ]
                                      --             []
                                      --         , text "Check me out"
                                      --         ]
                                      --     ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
    in
        Html.form [ onSubmit (ForSelf SubmitFields) ]
            [ div [ class "row section" ]
                [ div [ class "container" ]
                    [ div [ class "row" ]
                        [ div [ class "col-md-12 content content-left" ]
                            [ div [ class "row" ]
                                [ div [ class "col-xs-12" ]
                                    [ h1 []
                                        [ text (I18n.translate language I18n.AddNewTool) ]
                                    ]
                                ]
                            ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col-md-9 content content-left" ]
                            [ div [ class "row" ]
                                [ viewForm ]
                            ]
                        , div [ class "col-md-3 sidebar" ]
                            [ div [ class "row" ]
                                [ div [ class "col-xs-12" ]
                                    [ div [ class "thumbnail orga grey" ]
                                        [ div [ class "upload-container" ]
                                            [ label [ for "logoField" ]
                                                [ text "Logo" ]
                                            , div [ class "upload-zone" ]
                                                (case model.imageUploadStatus of
                                                    NotUploaded ->
                                                        [ span
                                                            [ attribute "aria-hidden" "true"
                                                            , class "glyphicon glyphicon-camera"
                                                            ]
                                                            []
                                                        , text "Upload image"
                                                        ]

                                                    Uploaded { contents, filename } ->
                                                        [ -- img [ src ("data:" ++ contents) ] []
                                                          p [] [ text filename ]
                                                        ]

                                                    UploadError err ->
                                                        [ span
                                                            [ attribute "aria-hidden" "true"
                                                            , class "glyphicon glyphicon-camera"
                                                            ]
                                                            []
                                                        , text ("Error: " ++ (toString err))
                                                          -- TODO Add a button to start upload again
                                                        ]
                                                )
                                            , input
                                                [ id "logoField"
                                                , on "change" (Decode.succeed (ForSelf ImageSelected))
                                                , type' "file"
                                                ]
                                                []
                                            ]
                                        ]
                                    ]
                                ]
                              -- , div [ class "row" ]
                              --     [ div [ class "col-xs-12" ]
                              --         [ i []
                              --             [ text "Maecenas " ]
                              --         ]
                              --     ]
                            ]
                        ]
                    ]
                ]
            , div [ class "row section-form last" ]
                [ div [ class "container" ]
                    [ div [ class "col-md-9 content content-left" ]
                        [ button
                            [ class "btn btn-default pull-right"
                            , disabled
                                (case model.imageUploadStatus of
                                    NotUploaded ->
                                        False

                                    Uploaded _ ->
                                        False

                                    UploadError _ ->
                                        True
                                )
                            , type' "submit"
                            ]
                            [ text (I18n.translate language I18n.PublishTool) ]
                        ]
                    ]
                ]
            ]


viewUseCase : Model -> I18n.Language -> Html Msg
viewUseCase model language =
    let
        viewForm =
            div [ class "col-xs-12" ]
                [ div [ class "row section-form" ]
                    [ div [ class "col-xs-12" ]
                        [ div [ class "form-group" ]
                            [ label [ for "nameField" ]
                                [ text "Name" ]
                            , input
                                [ class "form-control"
                                , id "nameField"
                                , onInput (\x -> ForSelf (SetField "Name" x))
                                , placeholder "What's the official name of the use case?"
                                , required True
                                , type' "text"
                                ]
                                []
                            ]
                        , div [ class "form-group" ]
                            [ label [ for "aboutField" ]
                                [ text "About" ]
                            , input
                                [ class "form-control"
                                , id "aboutField"
                                , onInput (\x -> ForSelf (SetField "Description" x))
                                , placeholder "Add a complete description"
                                , type' "text"
                                ]
                                []
                            ]
                        ]
                    ]
                , div [ class "row section-form" ]
                    [ -- TODO input text
                      -- , div [ class "col-xs-6" ]
                      --     [ div [ class "form-group" ]
                      --         [ label [ for "licenseField" ]
                      --             [ text "License" ]
                      --         , select [ class "form-control", id "licenseField" ]
                      --             [ option []
                      --                 [ text "1" ]
                      --             , option []
                      --                 [ text "2" ]
                      --             , option []
                      --                 [ text "3" ]
                      --             , option []
                      --                 [ text "4" ]
                      --             , option []
                      --                 [ text "5" ]
                      --             ]
                      --         ]
                      --     ]
                      div [ class "col-xs-12" ]
                        [ div [ class "form-group" ]
                            [ label [ for "websiteLinkField" ]
                                [ text "Website link" ]
                            , input
                                [ class "form-control"
                                , id "websiteLinkField"
                                , onInput (\x -> ForSelf (SetField "Website" x))
                                , placeholder "Enter the address of the informational website"
                                , type' "url"
                                ]
                                []
                            ]
                        ]
                    ]
                ]
    in
        Html.form
            [ onSubmit (ForSelf SubmitFields) ]
            [ div [ class "row section" ]
                [ div [ class "container" ]
                    [ div [ class "row" ]
                        [ div [ class "col-md-12 content content-left" ]
                            [ div [ class "row" ]
                                [ div [ class "col-xs-12" ]
                                    [ h1 []
                                        [ text (I18n.translate language I18n.AddNewUseCase) ]
                                    ]
                                ]
                            ]
                        ]
                    , div [ class "row" ]
                        [ div [ class "col-md-9 content content-left" ]
                            [ div [ class "row" ]
                                [ viewForm ]
                            ]
                        , div [ class "col-md-3 sidebar" ]
                            [ div [ class "row" ]
                                [ div [ class "col-xs-12" ]
                                    [ div [ class "thumbnail orga grey" ]
                                        [ div [ class "upload-container" ]
                                            [ label [ for "logoField" ]
                                                [ text "Logo" ]
                                            , div [ class "upload-zone" ]
                                                (case model.imageUploadStatus of
                                                    NotUploaded ->
                                                        [ span
                                                            [ attribute "aria-hidden" "true"
                                                            , class "glyphicon glyphicon-camera"
                                                            ]
                                                            []
                                                        , text "Upload image"
                                                        ]

                                                    Uploaded { contents, filename } ->
                                                        [ -- img [ src ("data:" ++ contents) ] []
                                                          p [] [ text filename ]
                                                        ]

                                                    UploadError err ->
                                                        [ span
                                                            [ attribute "aria-hidden" "true"
                                                            , class "glyphicon glyphicon-camera"
                                                            ]
                                                            []
                                                        , text ("Error: " ++ (toString err))
                                                          -- TODO Add a button to start upload again
                                                        ]
                                                )
                                            , input
                                                [ id "logoField"
                                                , on "change" (Decode.succeed (ForSelf ImageSelected))
                                                , type' "file"
                                                ]
                                                []
                                            ]
                                        ]
                                    ]
                                ]
                              -- , div [ class "row" ]
                              --     [ div [ class "col-xs-12" ]
                              --         [ i []
                              --             [ text "Maecenas " ]
                              --         ]
                              --     ]
                            ]
                        ]
                    ]
                ]
            , div [ class "row section-form last" ]
                [ div [ class "container" ]
                    [ div [ class "col-md-9 content content-left" ]
                        [ button
                            [ class "btn btn-default pull-right"
                            , disabled
                                (case model.imageUploadStatus of
                                    NotUploaded ->
                                        False

                                    Uploaded _ ->
                                        False

                                    UploadError _ ->
                                        True
                                )
                            , type' "submit"
                            ]
                            [ text (I18n.translate language I18n.PublishUseCase) ]
                        ]
                    ]
                ]
            ]