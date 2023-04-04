import React, { useState, useRef } from 'react';
import PropTypes from 'prop-types';
import { Link, NavLink } from 'react-router-dom';

const FilerList = ({ events }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const searchInput = useRef(null);

  const updateSearchTerm = () => {
    setSearchTerm(searchInput.current.value);
  };

  const matchSearchTerm = (obj) => {
    // eslint-disable-next-line camelcase
    const { id, published, created_at, updated_at, ...rest } = obj;
    return Object.values(rest).some(
      (value) => value.toLowerCase().indexOf(searchTerm.toLowerCase()) > -1
    );
  };

  const renderEvents = (eventArray) =>
    eventArray
      .filter((el) => matchSearchTerm(el))
      .map((event) => (
        <li key={event.id}>
          <NavLink to={`/filers/${event.id}`}>
            {event.ein}
            {' - '}
            {event.name}

          </NavLink>
        </li>
      ));

  return (
    <section className="FilerList">
      <input
        className="search"
        placeholder="Search"
        type="text"
        ref={searchInput}
        onKeyUp={updateSearchTerm}
      />

      <ul>{renderEvents(events)}</ul>
    </section>
  );
};

FilerList.propTypes = {
  events: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      ein: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
    })
  ).isRequired,
};

export default FilerList;