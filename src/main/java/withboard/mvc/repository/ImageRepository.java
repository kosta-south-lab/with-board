package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {

}
