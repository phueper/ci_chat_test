<html>
<head>
    <link href="/web/css/chat.css" rel="stylesheet">
</head>
<body>
<?php echo validation_errors(); ?>

<h1>Simple Chat</h1>
<div class="chat">
    <div class="chatoutput">
        <?php
        foreach ($chat as $chatItem) {
            ?><p>
                <span class="sender"><?php echo $chatItem['sender']?></span>: <?php echo $chatItem['text']?>
            </p><?php
        }
        ?>
    </div>
    <?php echo form_open('chat/create'); ?>
        <label for="sender">Name</label>
        <input name="sender" type="text" class="input"/><br />
        <label for="text">Message</label>
        <input name="text" type="text" class="input"/><br/>
        <input type="submit" name="submit" value="Abschicken"/>
    </form>
</div>
</body>
</html>