<casino>
  <div class="casino">
    <div class="ui grid centered">
        <div class="twelve wide column">
            <div class="ui list">
                <!-- player item template -->
                <div class="player item">
                    <img class="ui avatar image" src="{player.avatar}" alt="avatar">

                    <div class="content">
                        <div class="header"><b class="name"></b></div>
                        <div class="description event"></div>
                    </div>
                </div>
                <!-- end player item template -->

            </div>
            <div class="logout ui left floated secondary button inverted" onclick="{logout}">
  		<i class="left chevron icon"></i>Log Out
  	</div>
        </div>
        <div class="four wide column">
            <div class="search ui small icon input ">
                <input type="text" placeholder="Search Game">
                <i class="search icon"></i>
            </div>
        </div>
    </div>
    <div class="ui grid">
        <div class="twelve wide column">
            <h3 class="ui dividing header">Games</h3>

            <div class="ui relaxed divided game items links">

                <!-- game item template -->
                <div class="game item" each={games}>
                    <div class="ui small image">
                        <img src="" alt="game-icon" src="{icon}">
                    </div>
                    <div class="content">
                        <div class="header"><b class="name"></b></div>
                        <div class="description">
                          {description}
                        </div>
                        <div class="extra">
                            <div class="play ui right floated secondary button inverted" onclick="{play}">
                                Play
                                <i class="right chevron icon"></i>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end game item template -->

            </div>
        </div>
        <div class="four wide column">
            <h3 class="ui dividing header">Categories</h3>

            <div class="ui selection animated list category items">

                <!-- category item template -->
                <div class="category item" each={categories}>
                    <div class="content">
                        <div class="header">{name}</div>
                    </div>
                </div>
                <!-- end category item template -->

            </div>
        </div>
    </div>
  </div>
  <script>

    var tag = this;

    this.player = opts.player;

    tag.categories = tag.categories || [];
    tag.games = tag.games || [];

    var getCategories = function (callback) {
      $.ajax({
        url: '/categories',
        method: 'GET',
        contentType : 'application/json',
      }).then(function (categories) {
        callback(categories);
      });
    };

    var getGames = function (callback) {
      $.ajax({
        url: '/games',
        method: 'GET', 
        contentType : 'application/json',
      }).then(function (games) {
        callback(games);
      })
    };

    logout () {
      $.ajax({
        url: '/logout',
        type : 'POST',
        data : {
          username : 'rebecka'
        }
      }).then(function () {
        tag.unmount(true);
        riot.mount('login');
      });
    };

    play(event) {
      var game = event.item;
      var index = tag.games.indexOf(game);
      tag.unmount(true);
      riot.mount('ingame', { code : tag.games[index]['code'] });
    }

    getCategories(function (categories) {
      tag.categories = categories;
      tag.update();
    });

    getGames(function (games) {
      this.games = games;
      tag.games = games;
      tag.update();
    });

  </script>
</casino>



