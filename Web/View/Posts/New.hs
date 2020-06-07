module Web.View.Posts.New where
import Web.View.Prelude

data NewView = NewView { post :: NewPost }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Edit Post</li>
            </ol>
        </nav>
        <h1>New Post</h1>
        {renderForm post}
    |]

renderForm :: NewPost -> Html
renderForm post = formFor post [hsx|
    {textField #title}
    {textField #body}
    {submitButton}
|]
