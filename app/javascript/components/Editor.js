/* global window */

import React, { useState, useEffect } from 'react';
import { Routes, Route, useNavigate } from 'react-router-dom';
import Header from './Header';
import Event from './Event';
// import EventForm from './EventForm';
import FilerList from './FilerList';

const Editor = () => {
  const [events, setEvents] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await window.fetch('/api/v1/filers.json');
        if (!response.ok) throw Error(response.statusText);

        const data = await response.json();
        setEvents(data);
      } catch (error) {
        handleAjaxError(error);
      }

      setIsLoading(false);
    };

    fetchData();
  }, []);



  return (
    <>
      <Header />
      {isLoading ? (
        <p className='loading'>Loading...</p>
      ) : (
        <div className="grid">
          <FilerList events={events} />

          <Routes>
            <Route
              path=":id"
              element={<Event events={events} />}
            />
          </Routes>
        </div>
      )}
    </>
  );
};

export default Editor;