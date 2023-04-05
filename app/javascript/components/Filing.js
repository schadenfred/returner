import React from 'react';
import PropTypes from 'prop-types';
import { useParams } from 'react-router-dom';


const Filing = ({ filers }) => {
  const [filings, setFilings] = useState([]);

  const { id } = useParams();
  const filer = filers.find((e) => e.id === Number(id));

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await window.fetch('/api/v1/filers/`${id}`.json');
        if (!response.ok) throw Error(response.statusText);

        const data = await response.json();
        setFilings(data);
      } catch (error) {
        handleAjaxError(error);
      }
      setIsLoading(false);
    };

    fetchData();
  }, []);
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
          <strong>selected Filing Filings:</strong> {filer.ein}
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
      <div className="grid">
        <FilingList filings={filings} />

        <Routes>
          <Route
            path=":id"
            element={<Filing filings={filers} />}
          />
        </Routes>
      </div>
    </>
  );
};


Filing.propTypes = {
  filers: PropTypes.arrayOf(
    PropTypes.shape({
      tax_year: PropTypes.number.isRequired,
    })
  ).isRequired,
};

export default Filing;