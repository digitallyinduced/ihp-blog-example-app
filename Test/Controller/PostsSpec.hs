module Test.Controller.PostsSpec where

import Network.HTTP.Types.Status

import IHP.Prelude
import IHP.QueryBuilder (query)
import IHP.Test.Mocking
import IHP.Fetch

import IHP.FrameworkConfig
import IHP.HaskellSupport
import Test.Hspec
import Config

import Generated.Types
import Web.Routes
import Web.Types
import Web.Controller.Posts ()
import Web.FrontController ()
import Network.Wai
import IHP.ControllerPrelude

tests :: Spec
tests = aroundAll (withIHPApp WebApplication config) do
        describe "PostsController" $ do
            it "has no existing posts" $ withContext do
                count <- query @Post
                    |> fetchCount
                count `shouldBe` 0

            it "calling NewPostAction will render a new form" $ withContext do
                mockActionStatus NewPostAction `shouldReturn` status200

            it "creates a new post" $ withParams [("title", "Post title"), ("body", "Body of post")] do
                response <- callAction CreatePostAction

                let (Just location) = (lookup "Location" (responseHeaders response))
                location `shouldBe` "http://localhost:8000/Posts"

                -- Only one post should exist.
                count <- query @Post |> fetchCount
                count `shouldBe` 1

                -- Fetch the new post.
                post <- query @Post |> fetchOne

                get #title post `shouldBe` "Post title"
                get #body post `shouldBe` "Body of post"

            it "can show posts" $ withContext do
                post <- newRecord @Post
                    |> set #title "Lorem Ipsum"
                    |> set #body "**Mark down**"
                    |> createRecord

                response <- callAction ShowPostAction { postId = get #id post }

                response `responseStatusShouldBe` status200
                response `responseBodyShouldContain` "Lorem Ipsum"

                -- For debugging purposes you could do the following, to
                -- see the HTML printed out on the terminal.
                body <- responseBody response
                putStrLn (cs body)