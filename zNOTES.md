
6 examples, 5 failures

RUN TEST:   rspec spec/models/song_spec.rb
ROUTES:     localhost:3000/rails/info/routes

NOTE for file   views/songs/new.html.erb
    Why Artist capitalized
        <%= f.label :artist_id %>
    Why Artist isn't capitalized
        <%= f.label :artist_id, :artist %>

CREATING ASSOCIATED NEW OBJECTS

STEP 1: In the belongs_to model class build a writer & reader (for has many)

    FILE:   app/models/song.rb
        def artist_name=(name)
            self.artist = Artist.find_or_create_by(name: name)
        end

        def artist_name
            self.artist ? self.artist.name : nil
        end

STEP 2: In belongs_to controller add :has_many_name in the (strong params) belongs_to_params
            (:has_many_name     <<=>>   :artist_name)
            (belongs_to_params  <<=>>   song_params)

    FILE:   app/controllers/songs_controller.rb
        def song_params
            params.require(:song).permit(:title, :artist_name)
        end

STEP *3*: In belongs_to new erb page add the text_field :has_many_name

    FILE:   views/songs/new.html.erb
        <%= f.label :artist_name %>
        <%= f.text_field :artist_name %>

            ************ - OR - ************

STEP *3*:   In belongs_to new erb page add the collection_select :has_many_name
NOTE ERROR line 12 regarding =>>    :genre_name -OR- :content     

    FILE:   views/songs/new.html.erb
        <%= f.collection_select :genre_name, Genre.all, :name, :name %>
        <%= f.text_field :genre_name %>
                    - OR -
        <%= f.collection_select :genre_id, Genre.all, :id, :name %>
        <%= f.text_field :content %>

NOTE Test isn't passing but this code works except the Genre gives a number instead of a name
    FILE:   views/songs/new.html.erb
        <%= f.label :genre_name %>
        <%= f.collection_select :genre_name, Genre.all, :name, :name %>
 
NOTE Datalist is another option for *3*


Genre instance from the show page:
      Genre: <%= Genre.find(@song.genre_id) %>

GENRE FORM FIELD ANSWER
    <%= f.label :song_genre_id %>
    <%= f.collection_select :genre_id, Genre.all, :id, :name %>
  

FINAL ERROR =>>    Unable to find field :song_notes_1 that is not disabled

    ADDED to routes.rb file:     resources :notes
    ADDED reader/writer methods for note_content to the song class in file song.rb


    DELETED FROM FILE views/songs/new.html.erb
        <%= f.label :note.song.name %>
        <%= f.text_field :new_note %></br>

    NOTE Refer to code below from SINATRA PROJECT
        label for="title">Title</label>
        <input type="text" name="title" value="" />

    TRIES
        <label for="contents">Note</label>
        <input type="text" name="contents" value="" />

        <%= f.text_field :note_content %></br>
  
