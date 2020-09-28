document.addEventListener('DOMContentLoaded', () => {
  const $messageRooms = $('.message-rooms');
  if ($messageRooms.length) {
    const elems = {
      home: {
        $title: $('.title.home'),
        $roomHolder: $('.message-room-holder.home'),
      },
      away: {
        $title: $('.title.away'),
        $roomHolder: $('.message-room-holder.away'),
      },
    };

    const rooms = ['home', 'away'];

    const switchActiveRoom = (current) => {
      let other = '';
      if (current === 'home') other = 'away';
      else other = 'home';

      // swap the active container
      elems[current].$roomHolder.removeClass('hidden');
      elems[other].$roomHolder.addClass('hidden');
      // swap the active title
      elems[current].$title.addClass('active');
      elems[current].$title.removeClass('notif');
      elems[other].$title.removeClass('active');

      // scroll to the bottom of the current one JUST!!! in case
      const $msgs = $(`.${current} .message-container`);
      $msgs[0].scrollTop = $msgs[0].scrollHeight;
    };

    rooms.forEach((room) => {
      const currentRoom = elems[room];
      currentRoom.$title.on('click', () => {
        switchActiveRoom(room);
      });
    });

    // setup
    elems.home.$roomHolder.addClass('hidden');

    rooms.forEach((room) => {
      const $msgs = $(`.${room} .message-container`);
      $msgs[0].scrollTop = $msgs[0].scrollHeight;
    });
  }
});
