import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { Box } from "@mui/material";

import { Videos, ChannelCard } from "./";
import { fetchAPI } from "../utils/FetchAPI";

const ChannelDetail = () => {
  const [channelDetail, setChannelDetail] = useState(null);
  const [videos, setVideos] = useState([]);
  const { id } = useParams();
  console.log(channelDetail, videos);

  useEffect(() => {
    fetchAPI(`channels?part=snippet&id=${id}`).then((data) => {
      if (data && data.items) {
        // Check if data and items exist
        setChannelDetail(data?.items[0]);
      } else {
        console.error("No channel details found"); // Log if no data
        console.log("API Response:", data);
      }
    });
  
    fetchAPI(`search?channelId=${id}&part=snippet&order=date`).then((data) => {
      if (data) {
        // Check if data exists
        setVideos(data?.items);
      } else {
        console.error("No videos found"); // Log if no data
        console.log("API Response:", data);
      }
    });
  }, [id]); // Removed extra closing parenthesis here



  if (!channelDetail) return "Loading...";
  
  return (
    <Box minHeight="95vh">
    <Box>
      <div style={{
        background: "linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 29%, rgba(0,212,255,1) 100%)",
        zIndex: 10,
        height: "300px"
      }}/>
      <ChannelCard channelDetail={channelDetail} marginTop="-110px"/>
    </Box>
    <Box display="flex" p="2">
      <Box sx={{ mr: {sm: '100px'}}}/>
        <Videos videos={videos}/>
      </Box>
    </Box>
  )
};

export default ChannelDetail;
