import consumer from './consumer';
import { buildMessage } from './utils';

function createSubscription({ site_id, tour_id, room }) {
  const $container = $(`.${room} .message-container`);
  consumer.subscriptions.create(
    { channel: 'ChatroomChannel', site_id, tour_id },
    {
      connected() {
        console.log(
          `Connected to chatroom channel ${tour_id}:${site_id}`,
          'away site'
        );
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        $container.append(buildMessage(data));
        if ($container.parent().hasClass('hidden')) {
          $(`.title.${room}`).addClass('notif');
        }
        $(`.${room}-input`).val('');
        $container[0].scrollTop = $container[0].scrollHeight;
      },
    }
  );
}


document.addEventListener('DOMContentLoaded', () => {

  const [_, isTour, tour_id, isSite, site_id] = location.pathname.split('/');
  if (isTour === 'tours' && isSite === 'sites') {
    // for visitor to chatroom of site they are visiting
    createSubscription({ site_id, tour_id, room: 'away' });

    // connection for visitor back to their own chatroom
    if (user_site_id) {
      createSubscription({ tour_id, site_id: user_site_id, room: 'home' });
    }
  }
});
