import React from 'react';
import PropTypes from 'prop-types';
import { useParams } from 'react-router-dom';


const Filing = ({ filings }) => {
  const { filerId, filingId } = useParams();
  // const filing = filings.find((e) => e.id === Number(id));
  console.log(filerId)
  console.log(filingId)

  return (
    <>
      <h2>getsome</h2>
      {/* <AwardList filer={filer} /> */}
    </>
  );

};


Filing.propTypes = {
  filings: PropTypes.arrayOf(
    PropTypes.shape({
      tax_year: PropTypes.string.isRequired,
    })
  ).isRequired,
};

export default Filing;