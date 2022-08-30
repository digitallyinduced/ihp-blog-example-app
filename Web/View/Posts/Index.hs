module Web.View.Posts.Index where
import Web.View.Prelude

data IndexView = IndexView { posts :: [Post] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PostsAction}>Posts</a></li>
            </ol>
        </nav>
        <h1>Posts <a href={pathTo NewPostAction} class="btn btn-primary ml-4">+ New</a></h1>
        <table class="table table-responsive">
            <thead>
                <tr>
                    <th>Post</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>{forM_ posts renderPost}</tbody>
        </table>
    |]


renderPost post = [hsx|
    <tr>
        <td>{post}</td>
        <td><a href={ShowPostAction post.id}>Show</a></td>
        <td><a href={EditPostAction post.id} class="text-muted">edit</a></td>
        <td><a href={DeletePostAction post.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
