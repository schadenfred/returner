import React, { useState, useRef } from 'react';
import PropTypes from 'prop-types';
import { Link, NavLink } from 'react-router-dom';

const FilerList = ({ filers }) => {
  const [searchTerm, setSearchTerm] = useState('');
  const searchInput = useRef(null);

  const updateSearchTerm = () => {
    setSearchTerm(searchInput.current.value);
  };

  const matchSearchTerm = (obj) => {
    const { id, published, created_at, updated_at, ...rest } = obj;
    return Object.values(rest).some(
      (value) => value.toLowerCase().indexOf(searchTerm.toLowerCase()) > -1
    );
  };

  const renderFilers = (filerArray) =>
    filerArray
      .filter((el) => matchSearchTerm(el))
      .sort((a, b) => a.ein - b.ein)

      .map((filer) => (
        <li key={filer.id}>
          <NavLink to={`/filers/${filer.id}`}>
            {filer.ein}
            {' - '}
            {filer.name}
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

      <ul>{renderFilers(filers)}</ul>
    </section>
  );
};

FilerList.propTypes = {
  filers: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      ein: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
    })
  ).isRequired,
};


export default FilerList;