package withboard.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import withboard.mvc.domain.MemberRating;

public interface MemberRatingRepository extends JpaRepository<MemberRating, Long> {

}
