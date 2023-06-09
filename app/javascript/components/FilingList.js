import React, { useState, useRef } from 'react';
import PropTypes from 'prop-types';
import { useParams } from 'react-router-dom';

import { NavLink } from 'react-router-dom';


const FilingList = ({ filings }) => {
  const { filerId } = useParams();

  const renderFilings = (filingArray) =>
    filingArray
      .sort((a, b) => new Date(b.return_timestamp) - new Date(a.return_timestamp))
      .map((filing) => (
        <li key={filing.id}>
          <NavLink to={`/filers/${filerId}/filings/${filing.id}`}>
            {filing.tax_year}
          </NavLink>
        </li>
      ));

  return (
    <section className="FilingList">
      <ul>{renderFilings(filings)}</ul>
    </section>
  );
};

FilingList.propTypes = {
  filings: PropTypes.arrayOf(
    PropTypes.shape({
      tax_year: PropTypes.string.isRequired,
      return_timestamp: PropTypes.string.isRequired,
      tax_period_end_date: PropTypes.string.isRequired,
      is_valid_to_irs: PropTypes.string,
      url: PropTypes.string,
    })
  ),
};

export default FilingList;