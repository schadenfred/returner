import React from 'react';
import PropTypes from 'prop-types';
import { useParams } from 'react-router-dom';
import FilingList from './FilingList';

const Filer = ({ filers }) => {
  const { id } = useParams();
  const filer = filers.find((e) => e.id === Number(id));

  return (
    <>
      <h2>
        {filer.ein}
        {' - '}
        {filer.name}
      </h2>
      <FilingList filer={filer} />

    </>
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