module Web.Routes where
import IHP.RouterPrelude
import Generated.Types
import Web.Types

-- Generator Marker
instance AutoRoute PostsController
type instance ModelControllerMap WebApplication Post = PostsController

instance AutoRoute CommentsController
type instance ModelControllerMap WebApplication Comment = CommentsController

instance AutoRoute SessionsController

instance AutoRoute UsersController
type instance ModelControllerMap WebApplication User = UsersController

