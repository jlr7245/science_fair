export const buildMessage = ({ content, user_name, user_id }) => {
  const $newdiv = $('<div />', { class: 'message' });
  // current_user_id is declared at the bottom of show_tour.html.erb
  user_id === parseInt(current_user_id) && $newdiv.addClass("own");
  $('<p />').text(content).appendTo($newdiv);
  $('<span />', { class: 'message-author' }).text(user_name).appendTo($newdiv);
  return $newdiv;
};
