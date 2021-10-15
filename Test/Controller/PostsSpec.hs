module Test.Controller.PostsSpec where

import Network.HTTP.Types.Status (status200)

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


tests :: Spec
tests = beforeAll (mockContext WebApplication config) do
    describe "User controller" $ do
        it "has no existing posts" $ withContext do
            users <- query @Post |> fetch
            users `shouldBe` []

        it "responds with some content" $ withContext do
            content <- mockActionResponse NewPostAction
            isInfixOf "You can use Markdown here" (cs content) `shouldBe` True

        it "creates a new post" $ withParams [("title", "Post title"), ("body", "Body of post")] do
            mockActionStatus CreatePostAction `shouldReturn` status200

        it "returns a redirect header" $ withContext do
            hs <- headers (mockAction NewPostAction)
            lookup "Location" hs `shouldNotBe` Nothing