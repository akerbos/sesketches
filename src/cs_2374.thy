(* Raphael Reitzig, 2012. *)
(* MIT license *)

theory Mergesort
  imports Main
begin
  (* Model *)

  types dataset  =  "nat * string"

  fun leq :: "dataset \<Rightarrow> dataset \<Rightarrow> bool" where
     "leq (kx::nat, dx) (ky, dy) = (kx \<le> ky)"

  fun merge :: "dataset list \<Rightarrow> dataset list \<Rightarrow> dataset list" where
  "merge [] b = b" |
  "merge a [] = a" |
  "merge (a # as) (b # bs) = (if leq a b then a # merge as (b # bs) else b # merge (a # as) bs)"

  function (sequential) msort :: "dataset list \<Rightarrow> dataset list" where
    "msort []  = []" |
    "msort [x] = [x]" |
    "msort l   = (let mid = length l div 2 in merge (msort (take mid l)) (msort (drop mid l)))"
  by pat_completeness auto
    termination
    apply (relation "measure length")
  by simp+


  (* Properties *)

  definition sorted :: "dataset list \<Rightarrow> bool" where
    "sorted xl \<equiv> \<forall>i. i + 1 < length xl \<longrightarrow> leq (xl ! i) (xl ! (i + 1))"

  primrec counts :: "'a list \<Rightarrow> 'a \<Rightarrow> nat" where
    "counts []       x = 0"  |
    "counts (y # yl) x = counts yl x + (if x = y then 1 else 0)"


  lemma counts_app [iff]:
    "counts (l @ m) x = (counts l x) + (counts m x)"
    apply (induct_tac l)
    apply simp
    apply simp
  done

  (* Verification *)

  lemma merge_counts [simp]:
    "counts (merge a b) = counts (a @ b)"
    apply (induct_tac a b rule : merge.induct)
    apply simp
    apply simp
    apply (case_tac "leq a b")
    apply simp

    apply (rule ext)
    apply simp
  done

  theorem msort_counts [simp]:
    "counts (msort xl) = counts xl"
    apply (induct_tac xl rule : msort.induct)
    apply simp
    apply simp
    apply (rule ext)
    apply (drule_tac x="length (v # vb # vc) div 2" in meta_spec)
    apply (drule_tac x="length (v # vb # vc) div 2" in meta_spec)
    apply (unfold msort.simps)
    apply (drule meta_mp)
    apply simp
    apply (drule meta_mp)
    apply simp
    apply (unfold Let_def)
    apply (simp only : merge_counts)
    apply (simp only : counts_app)
    apply (fold counts_app)
    apply simp
  done

  lemma sorted_hd [iff]:
    "sorted (y # yl) = (sorted yl \<and> (yl \<noteq> [] \<longrightarrow> leq y (hd yl)))"
    apply (induct_tac yl)
    apply simp
    apply (simp add : sorted_def)
    apply simp
    apply (rule iffI)
    apply clarsimp
  sorry

  lemma basic_proof_idea [rule_format]:
    "sorted l1 \<and> sorted l2 \<longrightarrow> sorted (merge l1 l2)"
    apply (induct_tac l1 l2 rule : merge.induct)
    apply simp
    apply simp

    apply (case_tac "leq a b")
    apply (drule meta_mp)
    apply assumption

    apply (clarsimp simp add : sorted_hd)
    apply (case_tac "as")
    apply simp
    apply simp

    apply (rotate_tac 1)
    apply (drule meta_mp)
    apply assumption

    apply (clarsimp simp add : sorted_hd)
    apply (case_tac bs)
    apply simp
    apply simp
  done

  theorem msort_sorted: "sorted (msort xl)"
    apply (induct_tac xl rule : msort.induct)
    apply (simp add : sorted_def)
    apply (simp add : sorted_def)
    apply (simp add : basic_proof_idea)
  done
end

