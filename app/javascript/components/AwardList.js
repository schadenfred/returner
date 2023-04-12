import React, { useState, useRef } from 'react';
import PropTypes from 'prop-types';
import { Link, NavLink } from 'react-router-dom';

const AwardList = ({ filing }) => {

  return (
    <section className="AwardList">
      Awards
      <ul>
        <li>getsome</li>
        <li>{filer.id}</li>
      </ul>
    </section>
  );
};

export default AwardList;