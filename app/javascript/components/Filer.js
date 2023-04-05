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
        show awards
      </h2>
      <ul>
        <li>
          <strong>selected Filer Filings:</strong> {filer.ein}
          <strong>Type:</strong> {filer.ein}
        </li>
        <li>
          <strong>Date:</strong> {filer.ein}
        </li>
        <li>
          <strong>Title:</strong> {filer.ein}
        </li>
        <li>
          <strong>Speaker:</strong> {filer.ein}
        </li>
        <li>
          <strong>Host:</strong> {filer.ein}
        </li>
        <li>
          <strong>Published:</strong> {filer.ein}
        </li>
      </ul>
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