<login>

  <div class="login" style="display:block;">
    <div class="ui grid centered">
      <form>
        <div class="fields">
          <div class="required field">
            <div class="ui icon input">
            <input type="text" name="username" placeholder="Username">
            <i class="user icon"></i>
          </div>
        </div>
        <div class="required field">
          <div class="ui icon input">
            <input type="password" name="password" placeholder="Password">
            <i class="lock icon"></i>
          </div>
        </div>
        <div class="field">
          <div class="ui icon input">
            <input type="button" value="Login" onclick={login}>
            <i class="right chevron icon"></i>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>

  <script>
    var tag = this;
  
    login() {
      $.ajax({
        url: '/login',
        type : 'POST',
        data: {
          username: tag.username.value,
          password: tag.password.value
        }
      }).then(function (data) {
        var status = data.status;
        if (status === 'fail') {
          tag.username.value = '';
          tag.password.value = '';
        } else if (status === 'success') {
          tag.unmount(true);
          riot.mount('casino', data);
          // riot.route('#casino');
        }
      });
    };
  </script>

</login>