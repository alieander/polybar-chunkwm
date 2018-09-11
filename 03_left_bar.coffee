commands =
  active : "echo $(/usr/local/bin/chunkc tiling::query --desktop id)"
  name   : "osascript -e 'tell application \"System Events\"' -e 'set frontApp to name of first application process whose frontmost is true' -e 'end tell'"

currentIcon = ['',' ', ' ', ' ', ' ', ' ', 'ﴔ ']

command: "echo " +
          "$(#{commands.active}):::" +
          "$(#{commands.name}):::"


refreshFrequency: 1000

render: () ->
  """
    <link rel="stylesheet" href="./polybar/assets/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="/polybar/style.css" />
    <div class='screen'><div class='left'><ul class="spaces"></ul></div></div>
  """

update: (output) ->
  output = output.split(/:::/g)
  @handleSpaces(output)


handleSpaces: (list) ->
  $(".spaces").empty()
  $("<li>").prop("id", 1).addClass('apple').text("").appendTo(".spaces")
  $("<li>").prop("id", 2).addClass('space').text(currentIcon[list[0]]).appendTo(".spaces")
  $("<li>").prop("id", 3).addClass('current').text("#{list[1]}").appendTo(".spaces")

