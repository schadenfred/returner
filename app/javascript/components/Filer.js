import React from 'react';
import { Routes, Route } from 'react-router-dom';
import { useParams } from 'react-router-dom';

import PropTypes from 'prop-types';
import FilingList from './FilingList';

const Filer = ({ filers }) => {
  const { filerId } = useParams();
  const filer = filers.find((e) => e.id === Number(filerId));
  const filings = filer.filings

  return (
    <div className="filerContainer">
      <h2>
        {filer.ein}
        {' - '}
        {filer.name}
      </h2>

      <FilingList filings={filings} />
      <Routes>
        <Route
          path={`filers/${filerId}/filings/:filingId/*`}

        />
      </Routes>

    </div>
  );
};


Filer.propTypes = {
  filers: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      ein: PropTypes.string.isRequired,
      name: PropTypes.string.isRequired,
    })
  ).isRequired,
};

export default Filer;