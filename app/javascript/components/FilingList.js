import React, { useState, useRef } from 'react';
import PropTypes from 'prop-types';
import { Link, NavLink } from 'react-router-dom';

const FilingList = ({ filings }) => {
  const renderFilings = (filingArray) =>
    filingArray
      .map((filing) => (
        <li key={filing.id}>
          <NavLink to={`/filings/${filing.id}`}>
            {filing.ein}
            {' - '}
            {filing.name}

          </NavLink>
        </li>
      ));

  return (
    <section className="FilingList">
      <input
        className="search"
        placeholder="Search"
        type="text"
        ref={searchInput}
        onKeyUp={updateSearchTerm}
      />

      <ul>{renderFilings(filings)}</ul>
    </section>
  );
};

FilingList.propTypes = {
  filings: PropTypes.arrayOf(
    PropTypes.shape({
      tax_year: PropTypes.number.isRequired,
    })
  ).isRequired,
};

export default FilingList;