export const buildMessage = ({ content, user_name }) => {
  const $newdiv = $('<div />', { class: 'message' });
  $('<p />').text(content).appendTo($newdiv);
  $('<span />', { class: 'message-author' }).text(user_name).appendTo($newdiv);
  return $newdiv;
};
