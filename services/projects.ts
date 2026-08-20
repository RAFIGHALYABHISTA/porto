import { createClient } from "@/common/utils/server";

export const getProjectsData = async () => {
  const supabase = createClient();

  let { data, error } = await supabase.from("projects").select();

  if (error) throw new Error(error.message);
  if (!data) return [];

  return data.map((item) => {
    // Use local images from public/images folder
    const imageUrl = `/images/projects/${item.slug}.png`;
    
    console.log(`Image URL for ${item.slug}:`, imageUrl);

    return {
      ...item,
      image: imageUrl,
    };
  });
};

export const getProjectsDataBySlug = async (slug: string) => {
  const supabase = createClient();

  let { data, error } = await supabase
    .from("projects")
    .select()
    .eq("slug", slug)
    .single();

  // Handle case where no data found (not an error)
  if (error && error.code !== 'PGRST116') {
    console.error('Error fetching project by slug:', error);
    throw new Error(error.message);
  }
  if (!data) {
    console.log(`No project found with slug: ${slug}`);
    return null;
  }

  const { data: imageDataWebp } = supabase.storage
    .from("projects")
    .getPublicUrl(`${data.slug}.webp`);
  
  const { data: imageDataPng } = supabase.storage
    .from("projects")
    .getPublicUrl(`${data.slug}.png`);

  // Use local images from public/images folder
  const imageUrl = `/images/projects/${data.slug}.png`;
  
  console.log(`Image URL for ${slug}:`, imageUrl);

  return {
    ...data,
    image: imageUrl,
  };
};
