package kr.co.gudi.marketing.dto;

import org.apache.ibatis.type.Alias;

@Alias("music")
public class MusicChartDTO {
    private String musicRank;
    private String albumImageSrc;
    private String albumNo;
    private String songName;
    private String artistName;
    private String albumName;
    
	public String getMusicRank() {
		return musicRank;
	}
	public void setMusicRank(String musicRank) {
		this.musicRank = musicRank;
	}
	public String getAlbumImageSrc() {
		return albumImageSrc;
	}
	public void setAlbumImageSrc(String albumImageSrc) {
		this.albumImageSrc = albumImageSrc;
	}
	public String getAlbumNo() {
		return albumNo;
	}
	public void setAlbumNo(String albumNo) {
		this.albumNo = albumNo;
	}
	public String getSongName() {
		return songName;
	}
	public void setSongName(String songName) {
		this.songName = songName;
	}
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
}
