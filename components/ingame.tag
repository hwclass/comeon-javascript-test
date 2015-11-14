<ingame>
	<div class="ingame">
    <div class="ui grid centered">
      <div class="three wide column">
        <div class="ui right floated secondary button inverted" onclick="{back}"><i class="left chevron icon"></i>Back</div>
      </div>
      <div class="ten wide column">
        <div id="game-launch"></div>
      </div>
      <div class="three wide column"></div>
    </div>
	</div>
  <script>

    var gameCode = opts.code; 

    this.on('mount', function(){
      comeon.game.launch(gameCode);
    });

    back() {
      this.unmount(true);
      riot.mount('casino');
    };

  </script>
</ingame>
