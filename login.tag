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

    <!-- this script tag is optional -->
    <script>

      /*
      this.items = opts.items

      edit(e) {
        this.text = e.target.value
      }

      add(e) {
        if (this.text) {
          this.items.push({ title: this.text })
          this.text = this.input.value = ''
        }
      }

      removeAllDone(e) {
        this.items = this.items.filter(function(item) {
          return !item.done
        })
      }

      // an two example how to filter items on the list
      whatShow(item) {
        return !item.hidden
      }

      onlyDone(item) {
       return item.done
     }

      toggle(e) {
        var item = e.item
        item.done = !item.done
        return true
      }
      */

      login() {
        var result = $.ajax({
          url: '/login',
          type : 'POST',
          data: {
            username: 'rebecka',
            password: 'secret'
          },
          responseText: function (settings) {
            console.dir(000);
          } 
        });
      }
    </script>
</login>