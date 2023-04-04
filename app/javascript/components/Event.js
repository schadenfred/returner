import React from 'react';
import PropTypes from 'prop-types';
import { useParams } from 'react-router-dom';

const Event = ({ events }) => {
  const { id } = useParams();
  const event = events.find((e) => e.id === Number(id));

  return (
    <>
      <h2>
        {event.ein}
        {' - '}
        {event.name}
      </h2>
      <ul>
        <li>
          <strong>Type:</strong> {event.ein}
        </li>
        <li>
          <strong>Date:</strong> {event.ein}
        </li>
        <li>
          <strong>Title:</strong> {event.ein}
        </li>
        <li>
          <strong>Speaker:</strong> {event.ein}
        </li>
        <li>
          <strong>Host:</strong> {event.ein}
        </li>
        <li>
          <strong>Published:</strong> {event.ein}
        </li>
      </ul>
    </>
  );
};

Event.propTypes = {
  events: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      ein: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
    })
  ).isRequired,
};

export default Event;