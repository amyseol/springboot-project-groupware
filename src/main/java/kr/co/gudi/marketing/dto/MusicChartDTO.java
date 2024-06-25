package kr.co.gudi.marketing.dto;

import org.apache.ibatis.type.Alias;

@Alias("music")
public class MusicChartDTO {
    private final String musicRank;
    private final String albumImageSrc;
    private final String albumNo;
    private final String songName;
    private final String artistName;
    private final String albumName;
    
    public MusicChartDTO(String musicRank, String albumImageSrc, String albumNo,
    		String songName, String artistName, String albumName) {
    	this.musicRank = musicRank;
    	this.albumImageSrc = albumImageSrc;
    	this.albumNo = albumNo;
    	this.songName = songName;
    	this.artistName = artistName;
    	this.albumName = albumName;
    }
    
	public String getMusicRank() {
		return musicRank;
	}
	public String getAlbumImageSrc() {
		return albumImageSrc;
	}
	public String getAlbumNo() {
		return albumNo;
	}
	public String getSongName() {
		return songName;
	}
	public String getArtistName() {
		return artistName;
	}
	public String getAlbumName() {
		return albumName;
	}
}
