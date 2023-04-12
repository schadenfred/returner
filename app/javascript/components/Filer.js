import React from 'react';
import { Routes, Route, useNavigate, Outlet } from 'react-router-dom';

import PropTypes from 'prop-types';
import { useParams } from 'react-router-dom';
import FilingList from './FilingList';
import Filing from './Filing';

const Filer = ({ filers }) => {
  const { filerId, filingId } = useParams();
  const filer = filers.find((e) => e.filerId === Number(filerId));
  // const filings = filer.filings

  // exact
  // path = {
  //   [
  //   "/view/:section/:year/:productId", // '/view/electronics/2020/product1'
  //   "/view/:section/:productId"        // '/view/sportwear/product2'
  //   ]}
  // component = { SingleProduct }
  return (
    <>
      <FilingList filer={filer} />
      <Routes>
        <Route
          exact
          path={
            [
              "filers/:filerId/filings/:filingId",
              "filers/:filerId",
            ]
          }

          element={<Filer filers={filers} />}
        />
      </Routes>
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