import { Stack, Box } from "@mui/material";
import VideoCard from "./VideoCard";
import ChannelCard from "./ChannelCard";

const Videos = ({ videos, direction }) => {
  if (!videos?.length) return "Loading...";


  return (
    <Stack
      direction={direction || "row"}
      flexWrap="wrap"
      justifyContent="start"
      alignItems="start"
      gap={2}
    >
      {videos.map((item, index) => {
        // Check if there are valid child elements before rendering Box
        const hasVideo = item.id.videoId;
        const hasChannel = item.id.channelId;

        return hasVideo || hasChannel ? (
          <Box key={index} className="video-box">
            {hasVideo && <VideoCard video={item} />}
            {hasChannel && <ChannelCard channelDetail={item} />}
          </Box>
        ) : null; // Do not render Box if there are no valid children
      })}
    </Stack>
  );
};

export default Videos;
