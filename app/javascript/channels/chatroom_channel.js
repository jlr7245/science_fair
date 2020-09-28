import consumer from "./consumer"
import { buildMessage } from './utils';

document.addEventListener('update', (evt) => {
  console.log(evt)
  console.log('updated')
})

document.addEventListener('DOMContentLoaded', () => {

  const $homeContainer = $('.home .message-container');
  const $awayContainer = $('.away .message-container');
 
  const [_, isTour, tour_id, isSite, site_id] = location.pathname.split('/');
  if (isTour === 'tours' && isSite === 'sites') {
    
    // for visitor to chatroom of site they are visiting
    consumer.subscriptions.create({ channel: 'ChatroomChannel', site_id, tour_id }, {
      connected() {
        console.log(`Connected to chatroom channel ${tour_id}:${site_id}`, 'away site')
        // Called when the subscription is ready for use on the server
      },
    
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
    
      received(data) {
        // Called when there's incoming data on the websocket for this channel
        $awayContainer.append(buildMessage(data))
        $('.away-input').val('')
      }
    });

    // connection for visitor back to their own chatroom
    if (user_site_id) {
      consumer.subscriptions.create({ channel: 'ChatroomChannel', site_id: user_site_id, tour_id }, {
        connected() {
          console.log(`Connected to chatroom channel ${tour_id}:${user_site_id}`, 'home site')
        },
        disconnected() {
          // Called when the subscription has been terminated by the server
        },
        received(data) {
          // Called when there's incoming data on the websocket for this channel
          $homeContainer.append(buildMessage(data))
          $('.home-input').val('')
        }
      })
    }
  }

});
